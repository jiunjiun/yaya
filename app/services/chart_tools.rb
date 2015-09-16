class ChartTools
  TimeLineTemp = {'00': 0,
            '01': 0, '02': 0, '03': 0, '04': 0, '05': 0, '06': 0, '07': 0, '08': 0, '09': 0, '10': 0,
            '11': 0, '12': 0, '13': 0, '14': 0, '15': 0, '16': 0, '17': 0, '18': 0, '19': 0, '20': 0,
            '21': 0, '22': 0, '23': 0}

  def self.time_line(hash)
    TimeLineTemp.merge(hash.group_by { |t| t.datetime.strftime('%H').to_sym }.hmap{|k,v| { k => v.size}})
  end
end

class Hash
  def hmap(&block)
    self.inject({}){ |hash,(k,v)| hash.merge( block.call(k,v) ) }
  end
end
