require 'csv'

path = ARGV[0]

csv = CSV.read path, headers: true

header = <<-HEADER
  <?xml version="1.0" encoding="windows-1252"?>
  <List ListName="新加列表">
HEADER

close_header = "</List>"

xml = csv.map { |row|
  "
    <File>
      <FileName>#{row['Artist Name']} - #{row['Track Name']}</FileName>
    </File>
  ".gsub("&", " ")
}.join("\n")

File.write "output.kgl", header + xml + close_header
