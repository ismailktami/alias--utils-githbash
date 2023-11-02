#!/bin/bash -e
# cp  -r $1  $1/../backup

# Itère sur les fichiers de type .feature dans le dossier
# for feature_file in ./*/*.feature; do
#     if [ -f "$feature_file" ]; then
#         echo "Inserting line at the beginning of $feature_file"
#     fi
# done


find . -type f -name "*.feature" -exec sh -c 'foldername=$(basename $(dirname $(dirname "$0"))); sed -i "1i@$foldername" "$0"' {} \;

# start_directory="./"
# # Function to generate the Cucumber step definition
# generate_cucumber_step() {
#     local keyword1="$1"
#     local keyword2="$2"
#     local page="$3"
#     local link="$4"
#     local page_title="$5"

#     echo "$keyword1(\`the user clicks on the redirect button $page\`, () => {"
#     echo "  // put code here"
#     echo "  cy.get(\"a[href='/$link']\").click()"
#     echo "cy.url().should('include', '/$link')"
#     echo "});"

#     echo "$keyword2(\`the user should be redirected to $page page\`, () => {"
#     echo "  // put code here"
#     echo "  cy.contains('h1','$page_title')"
#     echo "  cy.log('the $page page is displayed correctly');"
#     echo "});"
# }

# rm  generated.js
# touch  generated.js
# # Traverse only the first level of directories and generate Cucumber step definitions
# # find "$start_directory" -maxdepth 1 -type d | while read -r directory; do
# #     # generate_cucumber_step "Then" "$(basename "$directory")" >> generated.js
# #     echo   $directory
# # done

# csv_file="file.csv"

# tail -n +2 "$csv_file" | while IFS=',' read -r button link pagetitle; do
#     generate_cucumber_step  When  Then  $button $link $pagetitle  >> generated.js
# done

# # rm  generated.js
