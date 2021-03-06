#
# Author:: Prabhu Das (<prabhu.das@clogeny.com>)
# Copyright:: Copyright (c) 2013 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe Ohai::System, "Aix plugin platform" do
  before(:each) do
    @plugin = get_plugin("aix/platform")
    allow(@plugin).to receive(:collect_os).and_return(:aix)
    kernel = Mash.new
    kernel[:name] = "aix"
    kernel[:version] = "1"
    kernel[:release] = "0"
    allow(@plugin).to receive(:kernel).and_return(kernel)
    @plugin.run
  end

  it "should set platform to aix" do
    expect(@plugin[:platform]).to eq("aix")
  end

  it "should set the platform_version" do
    expect(@plugin[:platform_version]).to eq("1.0")
  end

  it "should set platform_family" do
    expect(@plugin[:platform_family]).to eq(@plugin[:platform])
  end
end
