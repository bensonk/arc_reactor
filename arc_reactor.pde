void setup() {
  Serial.begin(9600);
  for(int i = 2; i <= 13; i++)
    pinMode(i, OUTPUT);
}

void set_lights(int v) {
  for(int i = 0; i <= 13; i++)
    digitalWrite(i, v);
}

void pulse_at(int intensity, long time) {
  int on_time = intensity;
  int off_time = 5 * (100 - intensity);
  long t = 0;
  while(t < (1000 * time)) {
    set_lights(HIGH);
    delayMicroseconds(on_time);
    set_lights(LOW);
    delayMicroseconds(off_time);
    t += on_time + off_time;
  }
}

void loop() {
  int duration = 15;
  for(float i = 0; i < 6.28; i += 0.02) {
    int v = ((sin(i)/2 + 0.5) * 60) + 30;
    pulse_at(v, duration);
  }
}
