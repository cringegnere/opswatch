require "opswatch/version"
require 'ruby-libappindicator'
require 'yaml'

require 'ops_tray'
require 'aws_poller'
require 'icon_pack'
require 'configuration'

module Opswatch
  class Main
    def initialize
      settings = Configuration.load_file(".opswatch.yml")
      @groups = {}
      settings.each do |k, v|
        @groups[k] = { tray: OpsTray.new(k, IconPack.new(k)), poller: AwsPoller.new(v) }
      end

      def self.start(_argv = nil)
        @instance = new

        Gtk.main
      end

      private

      def poll
        @groups.each do |_k, g|
          res = g[:poller].poll
          g[:tray].update_status(res)
        end
        true
      end
    end
  end
end
