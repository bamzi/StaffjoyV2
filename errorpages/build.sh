set -e

# instal go deps
go get -u github.com/GeertJohan/go.rice
go get -u github.com/GeertJohan/go.rice/rice

# Removes mac shitty things
find assets/ -type f -name '.DS_Store' -delete

# Put assets into the binary
rice embed-go

# Clean up data so it passes linter
gofmt -s -w rice-box.go

sed -i "s/package main/package errorpages/g" rice-box.go

echo "ERROR PAGES DONE!"
