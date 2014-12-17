module ProjectControllerHelper
  def code_later_url
    code_later_date = Date.tomorrow.strftime('%Y%m%d')
    code_later_start = code_later_date + 'T140000Z'
    code_later_end = code_later_date + 'T180000Z'
    'https://www.google.com/calendar/render?action=TEMPLATE&text=Code+with+CodeMontage&details=For+ideas,+visit+http://codemontage.com/projects.&location=Anywhere&sf=true&output=xml&dates=' + code_later_start + '/' + code_later_end
  end

  def project_tags_link_list(project, type)
    project.public_send(type).map do |tag|
      link_to tag.name, projects_path(tags: tag.name)
    end.join(', ').html_safe
  end
end
