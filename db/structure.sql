CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "attachments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "format" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar, "password" varchar, "created_at" datetime, "updated_at" datetime);
INSERT INTO schema_migrations (version) VALUES ('20150622120835');

INSERT INTO schema_migrations (version) VALUES ('20150622131337');

INSERT INTO schema_migrations (version) VALUES ('20150622131844');

INSERT INTO schema_migrations (version) VALUES ('20150622132507');

INSERT INTO schema_migrations (version) VALUES ('20150623082846');

INSERT INTO schema_migrations (version) VALUES ('20150623083016');

INSERT INTO schema_migrations (version) VALUES ('20150623120622');

INSERT INTO schema_migrations (version) VALUES ('20150623132318');

INSERT INTO schema_migrations (version) VALUES ('20150623140311');

INSERT INTO schema_migrations (version) VALUES ('20150623150227');

INSERT INTO schema_migrations (version) VALUES ('20150623150336');

INSERT INTO schema_migrations (version) VALUES ('20150623154459');

INSERT INTO schema_migrations (version) VALUES ('20150623154552');

INSERT INTO schema_migrations (version) VALUES ('20150623181146');

