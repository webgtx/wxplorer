# 2021 | webgtx
# dxv1d@tuta.io
# github.com/webgtx

import http.client as client
import sys

print('\n Web Server File Explorer 0.1\n')

def check_connection(url, uri):
    connection = client.HTTPSConnection(url)
    connection.request("GET", "/" + uri)
    response = connection.getresponse()
    connection.close()
    print(response.status, response.reason, ' - ' + url + '/' + uri)

def read_file(pointer):
    with open(pointer, 'r', encoding = 'utf-8') as f:
        return f.read()

def start_explorer(file, url):
    uri_dict = read_file(file).split()
    for word in uri_dict:
        check_connection(url, word)

start_explorer(sys.argv[1], sys.argv[2])
