# frozen_string_literal: true

module ArtistsHelper
  def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    icon = sort_direction == 'asc' ? "<i class='fas fa-sort-up'></i>" : "<i class='fas fa-sort-down'></i>"
    icon = column == sort_column ? icon : ''
    link_to "#{title} #{icon}".html_safe, column: column, direction: direction
  end
end
