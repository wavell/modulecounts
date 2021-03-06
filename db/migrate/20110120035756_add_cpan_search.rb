class AddCpanSearch < ActiveRecord::Migration
  def self.up
    r = Repository.create(:name => "CPAN (search)",
                          :url => "http://search.cpan.org",
                          :regex => ",\\s+(\\d+)\\sDistributions")
    r.update_count
    r.update_stats
  end
  def self.down
    Repository.where(:name => "CPAN (search)").last.try(:destroy)
    
  end
end
