﻿
#Область ОписаниеПеременных

&НаКлиенте
Перем ОбновитьИнтерфейс;

#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Элементы.мз_ИспользоватьРолиИсполнителей.Видимость = НаборКонстант.мз_ИспользоватьВидыЗадач;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
		
КонецПроцедуры

&НаКлиенте
Процедура ПриЗакрытии(ЗавершениеРаботы)
	Если ЗавершениеРаботы Тогда
		Возврат;
	КонецЕсли;
	ОбновитьИнтерфейсПрограммы();
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	
КонецПроцедуры

#КонецОбласти

&НаКлиенте
Процедура ОбновитьИнтерфейсПрограммы()
	
	Если ОбновитьИнтерфейс = Истина Тогда
		ОбновитьИнтерфейс = Ложь;
		ОбщегоНазначенияКлиент.ОбновитьИнтерфейсПрограммы();
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура СохранитьЗначениеРеквизита(ИмяКонстанты)
	
	КонстантаМенеджер = Константы[ИмяКонстанты];
	КонстантаЗначение = НаборКонстант[ИмяКонстанты];
	
	Если КонстантаМенеджер.Получить() <> КонстантаЗначение Тогда
		КонстантаМенеджер.Установить(КонстантаЗначение);
		Если ИмяКонстанты = "мз_ИспользоватьВидыЗадач" Тогда
			Элементы.мз_ИспользоватьРолиИсполнителей.Видимость = КонстантаЗначение;
			Если НЕ КонстантаЗначение и НаборКонстант.мз_ИспользоватьРолиИсполнителей Тогда
				Константы.мз_ИспользоватьРолиИсполнителей.Установить(Ложь);
				НаборКонстант.мз_ИспользоватьРолиИсполнителей = Ложь;
			КонецЕсли;
			Элементы.мз_СложныеСтатусыВВидахЗадач.Видимость = КонстантаЗначение;
			Если НЕ КонстантаЗначение и НаборКонстант.мз_СложныеСтатусыВВидахЗадач Тогда
				Константы.мз_СложныеСтатусыВВидахЗадач.Установить(Ложь);
				НаборКонстант.мз_СложныеСтатусыВВидахЗадач = Ложь;
			КонецЕсли;
		КонецЕсли;	
	КонецЕсли;       	
	
КонецПроцедуры

&НаКлиенте
Процедура КонстантаПриИзменении(Элемент)	
	СохранитьЗначениеРеквизита(Элемент.Имя);
КонецПроцедуры
