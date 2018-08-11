require 'ruby-libappindicator'

module Opswatch
  class OpsTray < AppIndicator::AppIndicator
    def initialize(name, icon_pack)
      super(name, "dialog-question", AppIndicator::Category::APPLICATION_STATUS)
      set_menu(Gtk::Menu.new)
      set_status(AppIndicator::Status::ACTIVE)
      @icon_pack = icon_pack
    end

    def update_status(resp)
      set_icon_status(compute_status(resp))
    end

    private

    def compute_status(resp)
      ret = 'UNKNOWN_STATE'
      ret = 'ONLINE' if resp[:online] && resp[:deploy_state] == 'successful'
      ret = 'FAILED' if resp[:setup_failed] || resp[:start_failed] || resp[:deploy_state] == 'failed'
      ret = 'OFFLINE' if resp[:online].nil? && resp[:setup_failed].nil? && resp[:start_failed].nil?
      ret = 'DEPLOYING' if resp[:running_setup] || resp[:deploy_state] == 'running'
      ret = 'INVALID_STATE' if resp[:exception]
      ret
    end

    def set_icon_status(status)
      case status
      when 'ONLINE'
        set_icon @icon_pack.fetch('positive')
      when 'OFFLINE'
        set_icon @icon_pack.fetch('off')
      when 'DEPLOYING'
        set_icon @icon_pack.fetch('hold')
      when 'FAILED'
        set_icon @icon_pack.fetch('negative')
      when 'INVALID_STATE'
        set_icon 'dialog-question'
      end
    end
  end
end
