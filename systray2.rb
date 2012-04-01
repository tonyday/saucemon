include Java

import java.awt.TrayIcon
import java.awt.event.MouseListener

if java.awt.SystemTray::isSupported()

  tray = java.awt.SystemTray::system_tray
  uncheck = java.awt.Toolkit::default_toolkit.get_image("uncheck.png")
  check = java.awt.Toolkit::default_toolkit.get_image("check.png")

  popup = java.awt.PopupMenu.new
  exit_item = java.awt.MenuItem.new("Exit")
  exit_item.addActionListener { java.lang.System::exit(0) }

  popup.add(exit_item)
  trayIcon = TrayIcon.new(uncheck, "Tray Demo", popup)
  trayIcon.image_auto_size = true

  tray.add(trayIcon)

  Thread.new do
    while true
      if trayIcon.image == check
        trayIcon.image = uncheck
      else
        trayIcon.image = check
      end
      sleep 5
    end
  end

end
