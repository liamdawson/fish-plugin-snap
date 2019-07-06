if [ -d /var/lib/snapd ]
  set -l snap_bin_path "/var/lib/snapd/snap/bin"
  set -l snap_desktop_path "/var/lib/snapd/desktop"
  
  contains -- $snap_bin_path $PATH
    or set -gx PATH $snap_bin_path $PATH
  
  set -q XDG_DATA_DIRS; or set XDG_DATA_DIRS "/usr/local/share:/usr/share"
  
  contains -- $snap_desktop_path $XDG_DATA_DIRS
    or set -gx XDG_DATA_DIRS $snap_desktop_path $XDG_DATA_DIRS
end
