# encoding: utf-8
module KeyValues

  # NEVER change the existed code sequence
  class Base < ActiveHash::Base
    def self.options
      all.map { |t| [t.name, t.code] }
    end

    # {code1: name1, code2: name2}
    def self.hash
      Hash[*(all.map { |t| [t.code, t.name] }.flatten)]
    end

  end

  class FlightKind < KeyValues::Base
    self.data = [
      {id: 1, name: 'Arrivals', code: :A },
      {id: 2, name: 'Departure', code: :D },
    ]
  end

  class FlightStatus < KeyValues::Base
    self.data = [
      {id: 1, zh: '準時', en: 'ON TIME', code: 'on_time', desc: '準時ON TIME'},
      {id: 2, zh: '出發', en: 'DEPARTED', code: 'departed', desc: '出發DEPARTED'},
      {id: 3, zh: '延遲', en: 'DELAY', code: 'delay', desc: '延遲DELAY'},
      {id: 4, zh: '時間更改', en: 'SCHEDULE CHANGE', code: 'schedule_change', desc: '時間更改SCHEDULE CHANGE'},
      {id: 5, zh: '取消', en: 'CANCELLED', code: 'cancelled', desc: '取消CANCELLED'},
      {id: 6, zh: '已到', en: 'ARRIVED', code: 'arrived', desc: '已到ARRIVED'},
    ]
  end
end
