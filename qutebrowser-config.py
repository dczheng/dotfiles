config.load_autoconfig(False)
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version} Edg/{upstream_browser_version}', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

c.content.notifications.enabled = True
c.content.proxy = 'socks://192.168.2.22:8321/'
c.url.default_page = 'https://www.google.com'
c.url.searchengines = {'DEFAULT': 'https://www.google.com/?q={}'}
c.url.start_pages = 'www.google.com'

c.colors.statusbar.normal.bg = '#696969'
c.colors.statusbar.command.bg = '#2F4F4F'
c.colors.tabs.bar.bg = '#696969'
c.colors.tabs.odd.bg = '#C0C0C0'
c.colors.tabs.even.bg = '#C0C0C0'
c.colors.tabs.odd.fg = '#696969'
c.colors.tabs.even.fg = '#696969'
c.colors.tabs.selected.odd.bg = '#2F4F4F'
c.colors.tabs.selected.even.bg = '#2F4F4F'
c.colors.tabs.selected.odd.fg = '#D3D3D3'
c.colors.tabs.selected.even.fg = '#D3D3D3'

config.bind("<alt+v>", ":set content.proxy socks://192.168.2.22:8321")
config.bind("<alt+c>", ":set content.proxy none")
