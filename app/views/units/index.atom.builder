atom_feed(:schema_date => "2008-04-22") do |feed|
  feed.title("#{@author.login} | Arritmia")
  feed.updated((@units.first.created_at))

  @units.each do |unit|
    feed.entry(unit, :url => user_unit_path(@owner, unit)) do |entry|
		  entry.id(unit.id)
      entry.content(unit.body, :type => 'text')
      entry.author do |author|
        author.name(@author.login)
      end
    end
  end
end
