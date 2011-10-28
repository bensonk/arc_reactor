void setup() {
  Serial.begin(9600);
  for(int i = 2; i <= 13; i++)
    pinMode(i, OUTPUT);
}

void set_lights(int v) {
  for(int i = 0; i <= 13; i++)
    digitalWrite(i, v);
}

void pulse_at(int intensity, int count) {
  int on_time = intensity;
  int off_time = 10 * (100 - intensity);
  int t = 0;
  while(t < count) {
    set_lights(HIGH);
    delayMicroseconds(on_time);
    set_lights(LOW);
    delayMicroseconds(off_time);
    t++;
  }
}

void loop() {
  int count = 20;
  for(int i = 5; i <= 90; i++) pulse_at(i, count);
  for(int i = 90; i > 5;  i--) pulse_at(i, count);
}
