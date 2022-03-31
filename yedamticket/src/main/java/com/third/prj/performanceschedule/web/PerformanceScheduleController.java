package com.third.prj.performanceschedule.web;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.json.JsonArray;
import javax.json.JsonNumber;
import javax.json.JsonObject;
import javax.json.JsonString;
import javax.json.JsonValue;
import javax.json.JsonValue.ValueType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.prj.performanceschedule.service.PerformanceScheduleService;
import com.third.prj.performanceschedule.service.PerformanceScheduleVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/consert")
public class PerformanceScheduleController {
	@Autowired PerformanceScheduleService pfmcDao;
	
	@RequestMapping("/consertSchedule.do")
	@ResponseBody
	public List<Map<String, Object>> consertSchedule() {
		List<PerformanceScheduleVO> listAll = pfmcDao.PerformanceScheduleList();
		
		JsonObject jsonObject = new JsonObject() {
			
			@Override
			public Collection<JsonValue> values() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int size() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public JsonValue remove(Object key) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public void putAll(Map<? extends String, ? extends JsonValue> m) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public JsonValue put(String key, JsonValue value) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Set<String> keySet() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean isEmpty() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public JsonValue get(Object key) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Set<Entry<String, JsonValue>> entrySet() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean containsValue(Object value) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean containsKey(Object key) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public void clear() {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public ValueType getValueType() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean isNull(String name) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public String getString(String name, String defaultValue) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getString(String name) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public JsonString getJsonString(String name) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public JsonObject getJsonObject(String name) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public JsonNumber getJsonNumber(String name) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public JsonArray getJsonArray(String name) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getInt(String name, int defaultValue) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public int getInt(String name) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public boolean getBoolean(String name, boolean defaultValue) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean getBoolean(String name) {
				// TODO Auto-generated method stub
				return false;
			}
		};
		JsonArray jsonArray = new JsonArray() {
			
			@Override
			public <T> T[] toArray(T[] a) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Object[] toArray() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public List<JsonValue> subList(int fromIndex, int toIndex) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int size() {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public JsonValue set(int index, JsonValue element) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean retainAll(Collection<?> c) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean removeAll(Collection<?> c) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public JsonValue remove(int index) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean remove(Object o) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public ListIterator<JsonValue> listIterator(int index) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public ListIterator<JsonValue> listIterator() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int lastIndexOf(Object o) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public Iterator<JsonValue> iterator() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean isEmpty() {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public int indexOf(Object o) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public JsonValue get(int index) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean containsAll(Collection<?> c) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean contains(Object o) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public void clear() {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean addAll(int index, Collection<? extends JsonValue> c) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean addAll(Collection<? extends JsonValue> c) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public void add(int index, JsonValue element) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean add(JsonValue e) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public ValueType getValueType() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean isNull(int index) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public <T extends JsonValue> List<T> getValuesAs(Class<T> clazz) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getString(int index, String defaultValue) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public String getString(int index) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public JsonString getJsonString(int index) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public JsonObject getJsonObject(int index) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public JsonNumber getJsonNumber(int index) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public JsonArray getJsonArray(int index) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public int getInt(int index, int defaultValue) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public int getInt(int index) {
				// TODO Auto-generated method stub
				return 0;
			}
			
			@Override
			public boolean getBoolean(int index, boolean defaultValue) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public boolean getBoolean(int index) {
				// TODO Auto-generated method stub
				return false;
			}
		};
		
		HashMap<String, Object> hash = new HashMap<>();
		
		for(int i = 0; i < listAll.size(); i++) {
			hash.put("title", listAll.get(i).getPSchNo());
			hash.put("start", listAll.get(i).getFrDt());
			
			jsonObject = new JsonObject() {
				
				@Override
				public Collection<JsonValue> values() {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public int size() {
					// TODO Auto-generated method stub
					return 0;
				}
				
				@Override
				public JsonValue remove(Object key) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public void putAll(Map<? extends String, ? extends JsonValue> m) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public JsonValue put(String key, JsonValue value) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public Set<String> keySet() {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public boolean isEmpty() {
					// TODO Auto-generated method stub
					return false;
				}
				
				@Override
				public JsonValue get(Object key) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public Set<Entry<String, JsonValue>> entrySet() {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public boolean containsValue(Object value) {
					// TODO Auto-generated method stub
					return false;
				}
				
				@Override
				public boolean containsKey(Object key) {
					// TODO Auto-generated method stub
					return false;
				}
				
				@Override
				public void clear() {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public ValueType getValueType() {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public boolean isNull(String name) {
					// TODO Auto-generated method stub
					return false;
				}
				
				@Override
				public String getString(String name, String defaultValue) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public String getString(String name) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public JsonString getJsonString(String name) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public JsonObject getJsonObject(String name) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public JsonNumber getJsonNumber(String name) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public JsonArray getJsonArray(String name) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public int getInt(String name, int defaultValue) {
					// TODO Auto-generated method stub
					return 0;
				}
				
				@Override
				public int getInt(String name) {
					// TODO Auto-generated method stub
					return 0;
				}
				
				@Override
				public boolean getBoolean(String name, boolean defaultValue) {
					// TODO Auto-generated method stub
					return false;
				}
				
				@Override
				public boolean getBoolean(String name) {
					// TODO Auto-generated method stub
					return false;
				}
			};
			jsonArray.add(jsonObject);
		}
		return jsonArray;
		
	}
}
