require 'spec_helper'

describe 'freeradius::modules' do

  context 'rhel_7' do
    let(:facts) {{
      :operatingsystem => 'RedHat',
      :radius_version  => '3.0.1'
    }}

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to create_class('freeradius::modules') }
    it { is_expected.to create_class('freeradius::3::modules') }
    it { is_expected.to create_file('/etc/raddb/mods-available').with_ensure('directory') }
    it { is_expected.to create_file('/etc/raddb/mods-enabled').with_ensure('directory') }
  end

  context 'rhel_6' do
    let(:facts) {{
      :operatingsystem => 'RedHat',
      :radius_version  => '2.1.0'
    }}

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to create_class('freeradius::modules') }
    it { is_expected.to create_class('freeradius::2::modules') }
    it { is_expected.to create_file('/etc/raddb/modules').with_ensure('directory') }
  end
end
