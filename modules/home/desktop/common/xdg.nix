{config, ...}: let
  browser = "thorium-browser.desktop";
  editor = "nvim.desktop";
  file-manager = "org.gnome.thunar.desktop";
  image-viewer = "imv-dir.desktop";
  image-editor = "org.kde.gimp";
  torrent = "qbittorrent.desktop";
  multimedia-viewer = "mpv.desktop";
in {
  xdg = {
    mimeApps = rec {
      enable = true;
      associations.added = defaultApplications;
      defaultApplications = {
        "inode/directory" = file-manager;

        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "application/xhtml+xml" = browser;
        "text/html" = browser;

        "x-scheme-handler/magnet" = torrent;
        "application/pdf" = browser;
        "application/x-shellscript" = editor;

        "image/jpeg" = image-editor;
        "image/bmp" = image-viewer;
        "image/gif" = image-viewer;
        "image/jpg" = image-viewer;
        "image/pjpeg" = image-viewer;
        "image/png" = image-editor;
        "image/tiff" = image-viewer;
        "image/webp" = image-editor;
        "image/x-bmp" = image-viewer;
        "image/x-gray" = image-viewer;
        "image/x-icb" = image-viewer;
        "image/x-ico" = image-editor;
        "image/x-png" = image-editor;
        "image/x-portable-anymap" = image-viewer;
        "image/x-portable-bitmap" = image-viewer;
        "image/x-portable-graymap" = image-viewer;
        "image/x-portable-pixmap" = image-viewer;
        "image/x-xbitmap" = image-viewer;
        "image/x-xpixmap" = image-viewer;
        "image/x-pcx" = image-viewer;
        "image/svg+xml" = image-viewer;
        "image/svg+xml-compressed" = image-viewer;
        "image/vnd.wap.wbmp" = image-viewer;
        "image/x-icns" = image-viewer;

        "video/mp3" = multimedia-viewer;
        "video/mp4" = multimedia-viewer;
        "video/mkv" = multimedia-viewer;
        "video/flac" = multimedia-viewer;
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };
}