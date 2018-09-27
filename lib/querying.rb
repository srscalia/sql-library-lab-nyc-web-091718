# create table series (
#   id INTEGER PRIMARY KEY,
#   title text,
#   author_id integer,
#   subgenre_id integer
# );
#
# create table subgenres (
#   id INTEGER PRIMARY KEY,
#   name text
# );
#
#
# create table authors (
#   id INTEGER PRIMARY KEY,
#   name text
# );
#
# create table books (
#   id INTEGER PRIMARY KEY,
#   title text,
#   year text,
#   series_id integer
# );
#
# create table characters (
#   id INTEGER PRIMARY KEY,
#   name text,
#   species text,
#   motto text,
#   series_id integer,
#   author_id integer
# );
#
# create table character_books (
#   id INTEGER PRIMARY KEY,
#   book_id integer,
#   character_id integer
# );

def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year from books join series on books.series_id = series.id where series.id = 1 ORDER BY books.year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto from characters order by motto limit 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, count(species) FROM characters group by species order by count(species) DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name from authors join series on authors.id = series.author_id join subgenres on series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title from series join characters where characters.species = 'human' group by series.title limit 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, count(character_books.character_id) as num from characters join character_books on characters.id = character_books.character_id group by characters.name order by num DESC"
end


# selects all of the books titles and years in the first series and orders them chronologically (FAILED - 1)
# returns the name and motto of the character with the longest motto (FAILED - 2)
# determines the most prolific species of characters and return its value and count (FAILED - 3)
# selects the authors names and their series' subgenres (FAILED - 4)
# selects the series title with the most characters that are the species "human" (FAILED - 5)
# selects all of the character names and their number of books they have appeared in, in descending order (FAILED - 6)
