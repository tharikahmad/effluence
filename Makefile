CFLAGS:=-fPIC -I$(ZABBIX_SOURCE)/include -I$(ZABBIX_SOURCE)/include/common $(CFLAGS)
OBJECTS:=$(patsubst %.c,%.o,$(wildcard src/*.c))

influxdb.so: $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) $(LIBS) `curl-config --libs` -lyaml -shared -o $@

all: influxdb.so

clean:
	rm -rf $(OBJECTS) influxdb.so
