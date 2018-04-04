module ApplicationHelper

  def display_error_message(errors, field_name, display_name = nil, no_name = false)
    if errors.present? && errors[field_name.to_sym].present?
      html = ""
      field_name = field_name.to_s
      display_name = display_name.present? ? display_name : field_name.capitalize
      if no_name
        html = "<span class='error_text'>
            #{errors[field_name.to_sym][0]}
            </span>".html_safe
      else
        html = "<span class='error_text'>
            #{display_name} #{errors[field_name.to_sym][0]}
            </span>".html_safe
      end
      html
    end
  end

  def all_trees_counter
    tree_count = Member.pluck(:tree_planted_count).sum
    return tree_count + 10000
  end

  def home_data
    return HomeContent.first
  end
end
