create table sample (
  pkey integer primary key,
  c1 real,
  c2 integer,
  c3 text,
  c4 blob,
  c5 numeric
);

insert into sample values
(-42, 1234.567, 12, 'hello', 'blob', '123.45'),
(1234567, 1234.567, 12, 'hello', 'blob', '123.45'),
(-1234567, -1234.567, 0xcccc, 'world', 'blob2', '12345'),
(1234567890, 123456.7, 0xcccccc, 'foo', 'bar', '12345e-4'),
(-1234567890, '123456.7zx', 0xcccccccc, 'baz', 'bar', '12345e-4cv'),
(12345678901, '123456zx', 0xfcccccccc, 'baz', 'bar', '12345e-4cv');

PRAGMA auto_vacuum = NONE;
PRAGMA secure_delete=OFF;

delete from sample;
