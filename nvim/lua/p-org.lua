require('orgmode').setup_ts_grammar()
-- Setup orgmode
require('orgmode').setup({
  org_agenda_files = '~/personal/docs/**/*',
  org_default_notes_file = '~/personal/docs/refile.org',
})
