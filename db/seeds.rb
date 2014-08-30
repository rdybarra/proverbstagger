# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

verse = Verse.create([
  { book: 'Proverbs', chapter: 1, verse: 1, text: 'This is the first verse.' },
  { book: 'Proverbs', chapter: 1, verse: 2, text: 'This is the second verse.' },
  ])

keyword = Keyword.create([
  { value: 'awesome'},
  { value: 'cool'},
  { value: 'hip'}
])

keyword_association = KeywordAssociation.create([
  { verse_id: 1, keyword_id: 1, count: 1},
  { verse_id: 1, keyword_id: 2, count: 1},
  { verse_id: 2, keyword_id: 3, count: 2},
  { verse_id: 2, keyword_id: 1, count: 1}
]);
