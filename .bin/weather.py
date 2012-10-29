#!/usr/bin/python
# -*- coding: utf-8 -*-

import urllib
from xml.dom import minidom
import re


class GetWeather:
    def __init__(self):
        self.city = 'MianYang'
        self.nextdays = 4
        self.url = '''http://www.google.com/ig/api?weather=%s&hl=zh-cn'''%self.city

    def get_weather(self):
        '''get weather info and return as a list'''

        forecast_tag_list = ('day_of_week','low','high','condition')

        handler = urllib.urlopen(self.url)
        content_type = handler.info().dict['content-type']
        charset      = re.search(r'charset=(.*)',content_type).group(1)
        if not charset:
            charset = 'utf-8'
        if charset.lower() != 'utf-8':
            html_data = handler.read().decode(charset).encode('utf-8')
        else:
            html_data = handler.read()

        dom = minidom.parseString(html_data)
        handler.close()

        forecast_doms = dom.getElementsByTagName('forecast_conditions')

        self.weather = []
        for forecast_dom in forecast_doms:
            self.weather.append([forecast_dom.getElementsByTagName(i)[0].getAttribute('data') for i in forecast_tag_list])

        self.weather = self.weather[0:self.nextdays]
        return self.weather


    def print_weather(self):
        '''print weather info'''
        print '%-10s%-10s%-10s%-10s'%('Weekday','Low(℃)','High(℃)','Condition')
        for day_info in self.weather:
            for val in day_info:
                print '%-7s'%val,
            print


if __name__ == '__main__':
    weather = GetWeather()
    weather.get_weather()
    weather.print_weather()
