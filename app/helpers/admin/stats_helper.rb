module Admin::StatsHelper
  def draw_chart(type, datas, options = {})
    chart_label = datas.keys
    chart_series = datas.values
    content_tag :div, nil, class: "ct-chart ct-perfect-fourth", data: { type: type, labels: chart_label, series: chart_series, options: options}
  end

  def render_custom_field_stats(field, answers, papers = 0)
    datas = answers.where(custom_field: field)
    case field.field_type
    when "radios", "checkboxes" then render "pie_chart", field: field, stats: datas.stats(papers)
    else render "data_table", field: field, datas: datas.includes(:user)
    end
  end
end
