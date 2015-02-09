include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe " lemp stack install" do
      describe package('nginx'), :if=>os[:family] == 'redhat' do
        it {should be_installed}
        it {should be_running}
        it {should be_enabled}
      end


    describe package('nginx'), :if=>os[:family] == 'ubuntu' do
          it {should be_installed}
          it {should be_running}
          it {should be_enabled}
      end

    describe package('php-fpm'), :if=>os[:family] == 'redhat' do
      it {should be_installed}
      it {should be_running}
      it {should be_enabled}
     end

     describe package('php'), :if=>os[:family] == 'redhat' do
       it {should be_installed}
     end
     decscrbe package('php-mysql'), :if=>[:family] == 'redhat' do
       it {should be_installed}
     end


    describe package('php5-fpm'), :if=>os[:family] == ' ubuntu' do
      it {should be_installed}
      it {should be_running}
      it {should be_enabled}
     end

     describe package('php5-mysql'), :if=>os[:family] == 'ubuntu'do
     it {should be_installed}
     end

     describe package('mariadb'), :if=os[:family] == 'redhat' | 'ubuntu' do
       it {should be_installed}
       it {should be_running}
       it {should be_enabled}
     end


end
