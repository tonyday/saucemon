include Java

import java.awt.TrayIcon
import java.awt.event.MouseListener

if java.awt.SystemTray::isSupported()

  @tray = java.awt.SystemTray::system_tray
  @uncheck = java.awt.Toolkit::default_toolkit.get_image("uncheck.png")
  @check = java.awt.Toolkit::default_toolkit.get_image("check.png")


  @popper = java.awt.PopupMenu.new

  @exit_item = java.awt.MenuItem.new("Exit")
  #check_item = java.awt.MenuItem.new("Check")
  uncheck_item = java.awt.MenuItem.new("UnCheck")
  @exit_item.addActionListener { java.lang.System::exit(0) }

  @popper.add(@exit_item)
  @trayIcon = TrayIcon.new(@uncheck, "Tray Demo", @popper)
  @trayIcon.image_auto_size = true

  @tray.add(@trayIcon)

  def foo
    @popper.removeAll
    Dir.chdir('/Users/dduser/projects/dd-tarps') do
      system('git fetch')
      #%x(git log --remotes=origin --not --branches).split("\n").each do |line|
      %x(git status).split("\n").each do |line|
        @popper.add(java.awt.MenuItem.new(line))
      end
    end
    @popper.add(@exit_item)

    #if trayIcon.image == check
    #  trayIcon.image = uncheck
    #  popper.remove(check_item)
    #  new_item = java.awt.MenuItem.new(ll.first)
    #  popper.add(new_item)
    #else
    #  trayIcon.image = check
    #  popper.remove(uncheck_item)
    #  popper.add(check_item)
    #end
  end

  foo
  #Thread.new do
  #  while true
  #    foo
  #  end
  #  sleep 3
  #end

end
