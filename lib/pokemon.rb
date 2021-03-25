class Pokemon
attr_accessor :name, :type, :db
attr_reader :id

def initialize(id:,name: ,type: ,db: )
    @id = id
    @name = name
    @type = type
    @db = db
    
end

def self.save(name,type,db)
    sql = <<-SQL
    INSERT INTO pokemon
    (name,type)
    VALUES (?,?)
    SQL
    
    db.execute(sql,name, type)

    # @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

end


def self.find(id,db)
    flattened_pokemon = db.execute("SELECT * FROM POKEMON WHERE id = ?", id).flatten
    Pokemon.new(id: flattened_pokemon[0],name: flattened_pokemon[1],type: flattened_pokemon[2],db: db)
    # sql = <<-SQL
    #     SELECT * 
    #     FROM pokemon 
    #     WHERE id = (?)
    #     LIMIT 1
    # SQL

    # db.execute(sql,id).map do |row|
    #     Pokemon.new(id: row[0],name: row[1],type:row[3],db: db)
    # end
    
  

end


end
