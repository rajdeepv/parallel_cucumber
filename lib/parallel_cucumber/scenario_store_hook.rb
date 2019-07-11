require_relative 'helper/scenario_store'

def scenario_store
  @scenario_store ||= ScenarioStore.new(ENV.fetch('TEST_BATCH_ID', 'no-batch')).store
end


After do |scenario|
  scenario_store.transaction do |s|
    s["#{scenario.location.file}:#{scenario.location.line}"] = {status: scenario.status, exception: scenario.exception}
  end
end