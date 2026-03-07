DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
  project_id INT AUTO_INCREMENT NOT NULL,
  project_name VARCHAR(128) NOT NULL,
  estimated_hours DECIMAL(7, 2),
  actual_hours DECIMAL(7, 2),
  difficulty INT,
  notes TEXT,
  PRIMARY KEY (project_id)
);

CREATE TABLE category (
  category_id INT AUTO_INCREMENT NOT NULL,
  category_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE step (
  step_id INT AUTO_INCREMENT NOT NULL,
  project_id INT NOT NULL,
  step_text TEXT NOT NULL,
  step_order INT NOT NULL,
  PRIMARY KEY (step_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
  material_id INT AUTO_INCREMENT NOT NULL,
  project_id INT NOT NULL,
  material_name VARCHAR(128) NOT NULL,
  num_required INT,
  cost DECIMAL(7, 2),
  PRIMARY KEY (material_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE project_category (
  project_id INT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
  UNIQUE KEY (project_id, category_id)
);


INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Paint fence', 5.00, 4.00, 1, 'easy');

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Solar installation', 8.00, 6.00, 3, 'Saved 2hrs on labor');

INSERT INTO category (category_name) VALUES ('Home Improvement');
INSERT INTO category (category_name) VALUES ('Energy Efficiency');
INSERT INTO category (category_name) VALUES ('Repairs');


INSERT INTO material (project_id, material_name, num_required, cost) VALUES(1, 'White Outdoor Paint', 2, 45.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES(1, 'Paint Brushes', 3, 15.50);


INSERT INTO step (project_id, step_text, step_order) VALUES(1, 'Sand down the rough spots on the wood', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES(1, 'Apply two coats of white outdoor paint', 2);


INSERT INTO material (project_id, material_name, num_required, cost) VALUES(2, 'Solar Panels', 10, 2000.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES(2, 'Power Inverter', 1, 500.00);


INSERT INTO step (project_id, step_text, step_order) VALUES(2, 'Mount brackets to the roof', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES(2, 'Connect wiring to the main electrical panel', 2);


INSERT INTO project_category (project_id, category_id) VALUES(1, 1); 
INSERT INTO project_category (project_id, category_id) VALUES(2, 2);

