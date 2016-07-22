CREATE TABLE `employee` (
	`id` int NOT NULL,
	`surname` varchar NOT NULL,
	`name` varchar NOT NULL,
	`birthdate` DATE NOT NULL,
	`phone` int,
	`sallery` int,
	`position` varchar,
	PRIMARY KEY (`id`)
);

CREATE TABLE `order` (
	`order_number` int NOT NULL,
	`employee_id` INT NOT NULL,
	`table_number` int NOT NULL,
	`date` DATE NOT NULL,
	PRIMARY KEY (`order_number`)
);

CREATE TABLE `menu` (
	`id` INT NOT NULL UNIQUE,
	`dish_name` varchar NOT NULL UNIQUE,
	`category` varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `dish` (
	`id` INT NOT NULL,
	`menu_id` INT NOT NULL,
	`cost` int,
	`weight` int,
	PRIMARY KEY (`id`)
);

CREATE TABLE `warehouse` (
	`ingradient_id` INT NOT NULL,
	`count` int
);

CREATE TABLE `ready_dishes` (
	`dish_number` INT NOT NULL,
	`dish` TEXT NOT NULL,
	`employee_id` INT NOT NULL,
	`order_id` INT NOT NULL,
	`date` DATE NOT NULL
);

CREATE TABLE `ingradients` (
	`id` INT NOT NULL UNIQUE,
	`name` varchar NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `dish_ingradients` (
	`dish_id` int NOT NULL,
	`ingradient_id` int NOT NULL
);

CREATE TABLE `list_of_dishes` (
	`dish_id` INT NOT NULL,
	`order` INT NOT NULL
);

ALTER TABLE `order` ADD CONSTRAINT `order_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`);

ALTER TABLE `dish` ADD CONSTRAINT `dish_fk0` FOREIGN KEY (`menu_id`) REFERENCES `menu`(`id`);

ALTER TABLE `warehouse` ADD CONSTRAINT `warehouse_fk0` FOREIGN KEY (`ingradient_id`) REFERENCES `ingradients`(`id`);

ALTER TABLE `ready_dishes` ADD CONSTRAINT `ready_dishes_fk0` FOREIGN KEY (`dish_number`) REFERENCES `dish`(`id`);

ALTER TABLE `ready_dishes` ADD CONSTRAINT `ready_dishes_fk1` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`);

ALTER TABLE `ready_dishes` ADD CONSTRAINT `ready_dishes_fk2` FOREIGN KEY (`order_id`) REFERENCES `order`(`order_number`);

ALTER TABLE `dish_ingradients` ADD CONSTRAINT `dish_ingradients_fk0` FOREIGN KEY (`dish_id`) REFERENCES `dish`(`id`);

ALTER TABLE `dish_ingradients` ADD CONSTRAINT `dish_ingradients_fk1` FOREIGN KEY (`ingradient_id`) REFERENCES `ingradients`(`id`);

ALTER TABLE `list_of_dishes` ADD CONSTRAINT `list_of_dishes_fk0` FOREIGN KEY (`dish_id`) REFERENCES `dish`(`id`);

ALTER TABLE `list_of_dishes` ADD CONSTRAINT `list_of_dishes_fk1` FOREIGN KEY (`order`) REFERENCES `order`(`order_number`);

