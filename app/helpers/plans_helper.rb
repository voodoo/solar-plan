module PlansHelper
  def my_plan_link
    if has_plan?
      link_to "My Solar Plan", plan_path(my_plan, token: my_plan.token), class: 'ui-btn ui-corner-all ui-btn-b'  
    else
      link_to 'Create your Solar Plan', new_plan_path, class: 'ui-btn ui-corner-all ui-btn-b'
    end
  end

  def kwh_count plan
    kwh = number_with_precision(plan.active_watt_hours/1000, precision: 0)
    "<span class='ui-li-count' title='#{plan.watt_hours} watt hours'><b>#{kwh}</b> kWh</span>".html_safe
  end

  def panel_details
    total = 0
    Priority.all.map do |priority|
      watt_hours = @plan.active_items_watts_by_priority(priority) 
      total      = watt_hours + total
      inso       = total / @plan.insolation
      {
        name: priority.name,
        watt_hours: total,
        inso: inso,
        panels: (inso / @plan.panel_size) + 1 #round up

      }
    end
  end

  def batt_details
    total = 0
    Priority.all.map do |priority|
      watt_hours = @plan.active_items_watts_by_priority(priority) 
      total      = watt_hours + total
      # kWh x (1 + (1 - Discharge)) * Autonomy
      multiplier = (1 + (1 - (@plan.discharge / 100.00))) * @plan.autonomy
      kwh        = total * multiplier 
      {
        name: priority.name,
        watt_hours: total,
        multiplier: multiplier,
        kwh: kwh
      }
    end
  end
end
