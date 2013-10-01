# Copyright (c) 2013, Rackspace Hosting

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

if node['margarine']['install']['pip']
  include_recipe 'python::pip'
else
  package 'python-pip' # TODO Platform independent naming.
end

python_pip 'flask'

python_pip 'beautifulsoup4'

# TODO Change with objectstore updates.
python_pip 'pyrax'

case node['margarine']['queue']['type']
when 'amqp'
  python_pip 'pika' do
    version '0.9.12'
  end
end

case node['margarine']['datastore']['type']
when 'mongodb'
  python_pip 'pymongo'
end

case node['margarine']['token_store']['type']
when 'redis'
  python_pip 'redis'
end