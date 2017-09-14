swiftlint.config_file = '.swiftlint.yml'
swiftlint.lint_files inline_mode: true

## Let's check if there are any changes in the project folder
has_app_changes = !git.modified_files.grep(/SampleApp/).empty?
## Then, we should check if tests are updated
has_test_changes = !git.modified_files.grep(/SampleAppTests/).empty?
## Finally, let's combine them and put extra condition 
## for changed number of lines of code
if has_app_changes && !has_test_changes && git.lines_of_code > 20
      fail("Tests were not updated", sticky: false)
end
