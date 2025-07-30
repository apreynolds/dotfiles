# TableSheet.unbindkey('i')
# TableSheet.bindkey('i', 'edit-cell')

# FOUND at https://github.com/saulpw/visidata/discussions/1543
# Opens file in cell using system "open"
@VisiData.global_api
def sys_open_resource(vd, resource):
  import subprocess, os, platform
  if platform.system() == 'Darwin':       # macOS
      subprocess.call(('open', resource))
  elif platform.system() == 'Windows':    # Windows
      os.startfile(resource)
  else:                                   # linux variants
      subprocess.call(('xdg-open', resource))

# Generic OS open
Sheet.addCommand('zCtrl+O', 'sysopen-cell', 'sys_open_resource(cursorValue)', 'Open cell with OS')
