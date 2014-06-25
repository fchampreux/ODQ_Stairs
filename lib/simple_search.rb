module SimpleSearch
  def search(filter)
    if filter.present?
      where('name like ?', "%#{filter}%")
    else
      where('TRUE')
    end
  end
end
