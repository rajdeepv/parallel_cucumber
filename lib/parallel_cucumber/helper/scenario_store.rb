require 'yaml/store'

class ScenarioStore
  def initialize(batch_id)
    @store_path = "parallel_cucumber_#{batch_id}_results_store.yml"
    @store = YAML::Store.new(@store_path)
  end

  def reset_store
    File.delete(@store_path) if File.exist?(@store_path)
  end

  def store
    @store
  end
end