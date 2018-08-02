class OpsTray < AppIndicator::AppIndicator
  def initialize(name, icons)
    super(name, "dialog-question", AppIndicator::Category::APPLICATION_STATUS)
    set_menu(Gtk::Menu.new)
    set_status(AppIndicator::Status::ACTIVE)
    @icons = icons
  end

  def update_status(resp)
    ret = 'ONLINE' if resp[:online] && resp[:deploy_state] == 'successful'
    ret = 'OFFLINE' if resp[:online].nil?
    ret = 'DEPLOYING' if resp[:running_setup] || resp[:deploy_state] == 'running'
    ret = 'FAILED' if resp[:setup_failed] || resp[:start_failed] || resp[:deploy_state] == 'failed'
    ret = 'INVALID_STATE' if resp[:exception]
    set_icon_status(ret)
  end

  private

  def set_icon_status(status)
    puts status
    case status
    when 'ONLINE'
      set_icon @icons['smile'].path
    when 'OFFLINE'
      set_icon @icons['sad'].path
    when 'DEPLOYING'
      set_icon @icons['thinking'].path
    when 'FAILED'
      set_icon @icons['crying'].path
    when 'INVALID_STATE'
      set_icon 'dialog-question'
    end
  end
end
