#!/usr/bin/ruby

require 'json'

webhook_url = "#{ENV['WEBHOOK_URL']}"
payload = {
    "channel" => "#monit",
    "username" => "mmonit",
    "text" => "[#{ENV['MONIT_HOST']}] #{ENV['MONIT_SERVICE']} - #{ENV['MONIT_DESCRIPTION']}"
}.to_json
cmd = "curl -X POST --data-urlencode 'payload=#{payload}' #{webhook_url}"
system(cmd)
