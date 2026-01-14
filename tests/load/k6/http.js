import http from 'k6/http';
import { sleep } from 'k6';

// This is a basic load generator to create steady CPU pressure.
// It's intentionally simple: we just need enough traffic to trigger HPA scaling.

export const options = {
  vus: 20,
  duration: '2m',
};

export default function () {
  http.get('http://127.0.0.1:8181/');
  sleep(0.1);
}
