require 'date'
require 'time'

BUILD_AT = 18 * 60 * 60
# 200履歴とればさすがに1件は alpha タグついたものあるでしょう
MAX_OF_SEARCHING_HISTORY = 200

class Symbol
  def call(*args)
    case
      when args.size > 0 then -> arg {self.to_proc[arg, *args]}
      else self.to_proc
    end
  end
end

def cron?
  ENV['TRAVIS_EVENT_TYPE'] == 'cron'
end

def with_buildable_tag?
  /^(.{19}).+\(.*(alpha_[^,]+),.*\)$/ =~ <<-`EOS`
      git log --oneline -n #{MAX_OF_SEARCHING_HISTORY} --decorate \
          --pretty=format:'%cd%d' --date=format:'%Y/%m/%d %H:%M:%S'
    EOS
      .split("\n")
      .select(&:include?.('tag: alpha_'))
      .first

  if Regexp.last_match[0]
    (Date.today - 7).to_time + BUILD_AT < Time.parse(Regexp.last_match[1]) &&
      yield(Regexp.last_match[2])
    true
  else
    false
  end
end

cron? && with_buildable_tag? {|tag|
  system "git checkout #{tag} > /dev/null 2>&1"
  puts tag
}
