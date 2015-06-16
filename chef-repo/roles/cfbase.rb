name "cfbase"
description "CloudFoundry base role - installs everything."
  override_attributes(
    :apache2 => {
      :prefork => { :min_spareservers => "5" }
    },
    :tomcat => {
      :worker_threads => "100"
    },
    :cloudfoundry => {
      :path => "/home/hackday/.cloudfoundry/devbox/vcap",
      :revision => "HEAD"
    },
    :mongodb => {
      :version => "1.8.1",
      :path => "/home/hackday/.cloudfoundry/devbox/deploy/mongodb"
    },
    :mysql => {
      :server_repl_password => "root",
      :bind_address => "127.0.0.1",
      :server_root_password => "root",
      :server_root_user => "root"
    },
    :nodejs => {
      :version => "0.4.8",
      :path => "/home/hackday/.cloudfoundry/devbox/deploy/nodejs"
    },
    :nginx => {
      :vcap_log => "/home/hackday/.cloudfoundry/devbox/sys/log/vcap.access.log"
    },
    :ruby18 => {
      :version => "1.8.7-p334",
      :path => "/home/hackday/.cloudfoundry/devbox/deploy/rubies/ruby-1.8.7-p334"
    },
    :services => ["redis","mysql","mongodb","postgresql"],
    :rubygems => {
      :rake => {:version => "0.8.7"},
      :version => "1.5.2",
      :bundler => {:version => "1.0.10"}
    },
    :ruby => {
      :version => "1.9.2-p180",
      :path => "/home/hackday/.cloudfoundry/devbox/deploy/rubies/ruby-1.9.2-p180"
    },
    :deployment => {
      :group => "hackday",
      :name => "devbox",
      :config_path => "/home/hackday/.cloudfoundry/devbox/config",
      :user => "hackday",
      :home => "/home/hackday/.cloudfoundry/devbox"
    },
    :erlang => {
      :version => "R14B02",
      :path => "/home/hackday/.cloudfoundry/devbox/deploy/erlang"
    },
    :postgresql => {:server_root_password => "root"},
    :redis => {
      :runner => "openstack",
      :version => "2.2.4",
      :path => "/home/hackday/.cloudfoundry/devbox/deploy/redis"
    }
  )
   run_list(
      "role[ruby]",
      "role[nats]",
      "role[cloudfoundry]",
      "role[router]",
      "role[ccdb]",
      "role[cloud_controller]",
      "role[health_manager]",
      "role[dea]",
      "role[Redis]",
      "role[mysql]",
      "role[mongodb]",
      "role[Postgresql]"
)
