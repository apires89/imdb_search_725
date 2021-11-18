class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model
  multisearchable against: [:title, :synopsis]
  pg_search_scope :search_title_synopsis,
  against: [:title, :synopsis],
  using: { tsearch: {
    prefix: true
    ##allows you to hit matches on half words
  }}
  pg_search_scope :global_search,
  against: [:title, :synopsis],
  associated_against: { director: [
    :first_name, :last_name
  ]},
  using: { tsearch: {
    prefix: true
    ##allows you to hit matches on half words
  }}

end
