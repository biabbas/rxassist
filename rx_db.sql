-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 08:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rx_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `time` time DEFAULT NULL,
  `ment_day` datetime(6) DEFAULT NULL,
  `created_on` datetime(6) NOT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `medical_id` bigint(20) DEFAULT NULL,
  `patient_id` bigint(20) NOT NULL
);

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `approved`, `time`, `ment_day`, `created_on`, `doctor_id`, `medical_id`, `patient_id`) VALUES
(5, 0, NULL, NULL, '2024-03-26 00:04:11.087609', NULL, 11, 30);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
);

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add medical', 7, 'add_medical'),
(26, 'Can change medical', 7, 'change_medical'),
(27, 'Can delete medical', 7, 'delete_medical'),
(28, 'Can view medical', 7, 'view_medical'),
(29, 'Can add profile', 8, 'add_profile'),
(30, 'Can change profile', 8, 'change_profile'),
(31, 'Can delete profile', 8, 'delete_profile'),
(32, 'Can view profile', 8, 'view_profile'),
(33, 'Can add ment', 9, 'add_ment'),
(34, 'Can change ment', 9, 'change_ment'),
(35, 'Can delete ment', 9, 'delete_ment'),
(36, 'Can view ment', 9, 'view_ment'),
(37, 'Can add symptom', 10, 'add_symptom'),
(38, 'Can change symptom', 10, 'change_symptom'),
(39, 'Can delete symptom', 10, 'delete_symptom'),
(40, 'Can view symptom', 10, 'view_symptom');

-- --------------------------------------------------------

--
-- Table structure for table `core_profile`
--

CREATE TABLE `core_profile` (
  `id` bigint(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `region` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL
);

--
-- Dumping data for table `core_profile`
--

INSERT INTO `core_profile` (`id`, `avatar`, `birth_date`, `region`, `gender`, `country`, `user_id`) VALUES
(4, 'profile/avator.png', '1998-04-12', '', 'Male', 'Pakistan', 5),
(5, 'profile/avator.png', '1999-11-12', 'South Asia', 'Male', 'Pakistan', 7),
(6, 'profile/avator.png', '1999-01-11', 'Asia', 'Male', 'India', 9),
(7, 'profile/avator.png', '1986-12-12', 'Asia', 'Male', 'India', 10),
(8, 'profile/avator.png', '2002-12-12', 'Asia', '', 'India', 22),
(9, 'profile/avator.png', '2003-12-07', 'Asia', 'Male', 'India', 23),
(10, 'profile/avator.png', '2000-12-06', 'sout', '', 'gange', 24),
(11, 'profile/avator.png', '2002-12-07', 'europe', 'Male', 'london', 25),
(12, 'profile/avator.png', '2002-12-02', 'Asia', 'None', 'India', 26),
(13, 'profile/avator.png', '2000-12-01', 'Bangalore', 'Male', 'India', 27),
(14, 'profile/avator.png', '2003-01-11', 'Bangalore', 'Male', 'India', 28),
(15, 'profile/avator.png', '2002-12-12', 'Wakanda', 'Male', 'ksfj', 29),
(16, 'profile/avator.png', '2002-05-31', 'bangalore', 'Male', 'india', 30);

-- --------------------------------------------------------

--
-- Table structure for table `core_user`
--

CREATE TABLE `core_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_patient` tinyint(1) NOT NULL,
  `is_doctor` tinyint(1) NOT NULL,
  `phonenumber` varchar(200) DEFAULT NULL
);

--
-- Dumping data for table `core_user`
--

INSERT INTO `core_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_patient`, `is_doctor`, `phonenumber`) VALUES
(1, 'pbkdf2_sha256$320000$VlHDTmfgTjhPFkxz5JtJXz$kGQbdj52lpKcDB7UW4LnpT5OlbqpX1pC/H5wGV7DwuY=', '2022-08-05 01:22:24.881763', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-08-02 20:11:03.218100', 0, 0, NULL),
(2, 'pbkdf2_sha256$320000$jIAd9OCFatJrycM03PU8Pp$qgRRQXJg6vIlTHEXAFQudNOt4TE36cu09F5VGOLK0OA=', '2022-08-05 01:21:36.409364', 0, 'usama', 'Usama', 'Subhani', 'usamasubhani@gmail.com', 0, 1, '2022-08-02 20:14:43.000000', 0, 1, '+923350616908'),
(5, 'pbkdf2_sha256$320000$jIAd9OCFatJrycM03PU8Pp$qgRRQXJg6vIlTHEXAFQudNOt4TE36cu09F5VGOLK0OA=', '2022-08-05 01:12:58.142095', 0, 'shah', '', '', 's@gmail.com', 0, 1, '2022-08-02 21:38:37.402888', 1, 0, NULL),
(7, 'pbkdf2_sha256$320000$ab5hrdjqEIFfbGqn5E9DsP$fKZiX95Y65RtSjwPBUTzwHbR6z25sU9BmD1RhO92vvA=', '2022-08-04 15:51:28.280593', 0, 'ali', '', '', 'ali@gmail.com', 0, 1, '2022-08-03 23:15:38.305476', 1, 0, NULL),
(8, 'pbkdf2_sha256$720000$PLStY13iD4to5jtri0DiLL$WmOU8tWpoMmEjbnHsiJztRMtHGBr9kRDqUCIuD1FfSM=', '2024-04-04 18:25:34.546819', 1, 'Abbas', 'BI Mohammed', 'Abbas', 'bimohammadabbas@gmail.com', 1, 1, '2023-12-03 16:12:14.000000', 0, 1, '6362187881'),
(9, 'pbkdf2_sha256$320000$6NZA63YIYD6XQLepdIZfAm$+AVIkJ+1zvzrQK7JpQDzi9GYrJB+DZBrKNWYiQTNQwo=', '2023-12-17 09:40:25.901564', 0, 'biabbas', '', '', 'biabbbas@gmail.com', 0, 1, '2023-12-03 16:17:54.401205', 1, 0, NULL),
(10, 'pbkdf2_sha256$320000$gKf9SkIsAqYCBVxImeRAzn$0wQly0MM1C4b2rSBfJ17xYy+9xepgVpVKuexZu3VOqs=', '2023-12-21 10:09:34.203451', 0, 'chirag', '', '', 'chirag@gmail.com', 0, 1, '2023-12-05 12:54:08.466811', 1, 0, NULL),
(22, 'pbkdf2_sha256$320000$rBePDBF1FUMm8ffzehkvmc$KM9AxprHgbZA6yA853O5534WJUbKmgPeupd18zytE6Y=', '2023-12-17 13:06:42.086507', 0, 'bi79', '', '', 'bi@gg.com', 0, 1, '2023-12-17 13:06:22.298357', 1, 0, NULL),
(23, 'pbkdf2_sha256$320000$dUjJFEgBTFdeeS41JlXDTv$xQinrWgSbxDNLvhATMN2OXyeW7YR+QP3nDuE2nitHnk=', NULL, 0, 'bi88', '', '', 'bim@gmg.com', 0, 1, '2023-12-17 13:12:48.581583', 1, 0, NULL),
(24, 'pbkdf2_sha256$320000$Jnq0sjrDyIjqtfIMvSyZvs$ObbWqlr3ON8BzLz/UjB0hE8Zx8jRuIsYAIMRq630nlY=', NULL, 0, 'bi22', '', '', 'b@g.com', 0, 1, '2023-12-17 13:16:50.063247', 1, 0, NULL),
(25, 'pbkdf2_sha256$320000$Io6XQChsPcsyxq6eJg2qFS$fQqD1rN5TnBjjXNS2yJfYDHNVP89N0K9UMeMStijuuI=', '2024-01-09 04:07:36.526785', 0, 'bi20', '', '', 'l@e.pum', 0, 1, '2023-12-17 13:21:54.966188', 1, 0, NULL),
(26, 'pbkdf2_sha256$320000$aUqiFXBNXANkVdCUWjqURg$Nkdy/P2ji1ZmSWaDqP2td/6r6y13CkM3ZP1AcW/ABHQ=', '2023-12-20 15:14:21.483042', 0, 'ch', '', '', 'b@k.c', 0, 1, '2023-12-19 14:01:50.318791', 1, 0, NULL),
(27, 'pbkdf2_sha256$720000$DGHYY7dTnlc7nM34dD8guJ$r9Ry0IkRx0nafcfy7eeb7zPNWnVCjJGo+fNrabAyK8I=', '2024-04-04 16:45:14.971839', 0, 'dem2', '', '', 'demo2@gmail.com', 0, 1, '2024-03-16 12:04:01.516441', 1, 0, NULL),
(28, 'pbkdf2_sha256$720000$1X3FSSDkKKfmErf3vy1JzI$NsDhEE+buJa7SXjkrjc6ybpPdp3o5/VvyjBUYpixQGA=', '2024-03-20 17:28:02.182314', 0, 'mdabbas', '', '', 'bimohammadabbas@gmail.com', 0, 1, '2024-03-20 17:22:56.904305', 1, 0, NULL),
(29, 'pbkdf2_sha256$720000$8TJ7D9IfxWrVtdiO3PFxft$B9D3RSTzAtwGUu5mr6TZuRNDRRjai6bMsARejtk70Fg=', '2024-03-25 17:30:23.085896', 0, 'dem3', '', '', 'bimo@gmail.com', 0, 1, '2024-03-25 17:30:09.406097', 1, 0, '3254535323'),
(30, 'pbkdf2_sha256$720000$LuPM8YTImRkJoBl42Fl4Fs$+FTjtn4kGo2NYSEl01uewSpM5zGm7s2DTuA8/x6p8AI=', '2024-04-04 18:14:05.902323', 0, 'Shashank M R', '', '', 'smr9972675366@gmail.com', 0, 1, '2024-03-25 18:32:19.671160', 1, 0, '9972675366');

-- --------------------------------------------------------

--
-- Table structure for table `core_user_groups`
--

CREATE TABLE `core_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `core_user_user_permissions`
--

CREATE TABLE `core_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis_symptoms`
--

CREATE TABLE `diagnosis_symptoms` (
  `patient_diagnosis_id` bigint(20) NOT NULL,
  `symptom` varchar(766) DEFAULT NULL
);

--
-- Dumping data for table `diagnosis_symptoms`
--

INSERT INTO `diagnosis_symptoms` (`patient_diagnosis_id`, `symptom`) VALUES
(9, 'abdominal_pain,acute_liver_failure,altered_sensorium,back_pain,chills,continuous_feel_of_urine,extra_marital_contacts,history_of_alcohol_consumption,pain_during_bowel_movements'),
(10, 'abdominal_pain,acute_liver_failure,altered_sensorium,back_pain,chills,continuous_feel_of_urine,extra_marital_contacts,history_of_alcohol_consumption,'),
(11, 'breathlessness,continuous_feel_of_urine,cough,cramps,joint_pain'),
(12, 'altered_sensorium,cold_hands_and_feets'),
(13, 'anxiety,cramps,hip_joint_pain,loss_of_smell,malaise'),
(15, 'constipation,blackheads,fluid_overload,fast_heart_rate');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-08-02 20:15:07.156978', '2', 'usama', 1, '[{\"added\": {}}]', 6, 1),
(2, '2022-08-02 20:15:40.121734', '3', 'absar', 1, '[{\"added\": {}}]', 6, 1),
(3, '2022-08-02 20:16:07.053480', '3', 'absar', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 6, 1),
(4, '2022-08-02 20:16:15.287156', '2', 'usama', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 6, 1),
(5, '2022-08-02 20:17:25.367319', '2', 'usama', 2, '[]', 6, 1),
(6, '2022-08-02 21:41:15.137826', '2', 'usama', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 6, 1),
(7, '2022-08-02 21:45:23.296368', '2', 'usama', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 6, 1),
(8, '2022-08-02 21:45:49.622705', '2', 'usama', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 6, 1),
(9, '2022-08-02 21:46:05.424582', '3', 'absar', 2, '[{\"changed\": {\"fields\": [\"Email address\", \"Active\"]}}]', 6, 1),
(10, '2022-08-02 21:46:52.184090', '3', 'absar', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 6, 1),
(11, '2022-08-04 15:12:37.764455', '2', 'usama', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 6, 1),
(12, '2023-12-05 07:57:48.626917', '8', 'Abbas', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Is doctor\", \"Phonenumber\"]}}]', 6, 8),
(13, '2023-12-05 08:03:14.393298', '5', 'Hypertension', 2, '[{\"changed\": {\"fields\": [\"Disease\", \"Doctor\"]}}]', 7, 8),
(14, '2023-12-17 13:14:09.986479', '9', 'India', 2, '[{\"changed\": {\"fields\": [\"Gender\"]}}]', 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
);

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'core', 'medical'),
(9, 'core', 'ment'),
(8, 'core', 'profile'),
(10, 'core', 'symptom'),
(6, 'core', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
);

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-08-02 20:07:11.940307'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-08-02 20:07:11.991364'),
(3, 'auth', '0001_initial', '2022-08-02 20:07:12.172850'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-08-02 20:07:12.210672'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-08-02 20:07:12.218232'),
(6, 'auth', '0004_alter_user_username_opts', '2022-08-02 20:07:12.224229'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-08-02 20:07:12.232912'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-08-02 20:07:12.234909'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-08-02 20:07:12.242904'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-08-02 20:07:12.250544'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-08-02 20:07:12.257669'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-08-02 20:07:12.273362'),
(13, 'auth', '0011_update_proxy_permissions', '2022-08-02 20:07:12.280288'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-08-02 20:07:12.286600'),
(15, 'core', '0001_initial', '2022-08-02 20:07:12.788235'),
(16, 'admin', '0001_initial', '2022-08-02 20:07:12.887972'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-08-02 20:07:12.906525'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-08-02 20:07:12.919273'),
(19, 'sessions', '0001_initial', '2022-08-02 20:07:12.952848');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
);

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('71555g6v8ajo5e7j8slrf1hngh0i79lr', '.eJxVjEEOwiAQRe_C2pBCKQwu3XsGMsxMpWrapLQr492VpAvdvvf-f6mE-1bSXmVNE6uzAnX6ZRnpIXMTfMf5tmha5m2dsm6JPmzV14XleTnav4OCtbS1d9jDGIJjMSAC1kQcg83WGesCEbPzRHGIg8k-QMeSracOgb4IevX-AOh1N74:1rsRmI:M2ENN9VNercZjUPUeKDoLdsiOcrVCErYMO5xnuq1m1U', '2024-04-18 18:25:34.562269'),
('b3i05mbbxdshui0vhvtosgkyipxvuseo', '.eJxVjDsOwjAQBe_iGlng_1LScwZr7fXiALKlOKkQd4dIKaB9M_NeIuK61LiOMseJxFkoEIffMWF-lLYRumO7dZl7W-YpyU2ROx3y2qk8L7v7d1Bx1G_tErMFrUs4FsXeA3uw7BzYTN4GsiZ447LWiKoAO00nYkrZEpEx5MT7Aw5KOKE:1roo9P:Un-D0Hw2I6fmiD5xxSzCBM_uVvwYzhfBahhznrNKfn8', '2024-04-08 17:30:23.087765'),
('bv75texjw8quxynb7fpu9oao8kvkwh9k', '.eJxVjEEOwiAQRe_C2pDCFAGX7nsGMsxMpWpoUtqV8e7apAvd_vfef6mE21rS1mRJE6uLMur0u2Wkh9Qd8B3rbdY013WZst4VfdCmh5nleT3cv4OCrXxr2wlFcdmM5EPvwTEFFymcUbyzI_YOcsw5IPgYGKzYDoCMGPDMxEa9P-jtOAo:1oJm2i:p7aBde_VFneuZyz75qZbYff4P-5gEwR4sEQUrR5KzhQ', '2022-08-19 01:22:24.885145'),
('erpaora7n0svpx9dnc8nd1eay58d2f9v', '.eJxVjEEOwiAQRe_C2hBaUAaX7nuGZoYZpGogKe3KeHfbpAvd_vfef6sR1yWPa5N5nFhdFajT70YYn1J2wA8s96pjLcs8kd4VfdCmh8ryuh3u30HGlrf6QgEdeGeQxBl2cBbsLEByhBLYA6BPPbL06MSmAJ0VJo_WxI3aqD5f-As4pQ:1rGGAg:5zbAWU9KqdZc1tEvDLsrfMhkL_pwpfPcz9vwJgIR6Is', '2024-01-04 10:20:54.656462'),
('qkpaj7v6cl4f7k6qqvrw2jha8bsg5k5s', '.eJxVjEsOAiEQBe_C2hB6mKHFpXvPQGi6kVEDyXxWxrsbklno9lXVe6sQ962EfZUlzKwuCow6_Y4U01NqJ_yI9d50anVbZtJd0Qdd9a2xvK6H-3dQ4lp6DflMEwIgoOUEfrRemAYDMoChyaE31qCbhNH5BEJ2RJeSyewhE6nPF-UKN50:1rAqra:7_sz7s-ANZrFEFFnNEfKOAtSqB3WA28yhoHDC7wxbpQ', '2023-12-20 12:18:50.111028'),
('ycd4ngufas32sx3osp8i3cw090ibsdyo', '.eJxVjMsOwiAQRf-FtSEjz-LSvd9AgBmkaiAp7cr475akC92ec-59Mx-2tfit0-JnZBfm2OmXxZCeVIfAR6j3xlOr6zJHPhJ-2M5vDel1Pdq_gxJ6GeuMCqURABqiNiYKMi7R5IwVQU07T1krGciAxUwSpDhbG9HuPlkE9vkC1lQ3RQ:1r9pGj:fhXEGQogkBRtXkz_JLYbs_HD0WotX3py-cCe41U3xDs', '2023-12-17 16:24:33.020831');

-- --------------------------------------------------------

--
-- Table structure for table `patient_diagnosis`
--

CREATE TABLE `patient_diagnosis` (
  `id` bigint(20) NOT NULL,
  `disease` varchar(200) NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `patient_id` bigint(20) NOT NULL,
  `num_symptoms` int(11) NOT NULL DEFAULT 0
);

--
-- Dumping data for table `patient_diagnosis`
--

INSERT INTO `patient_diagnosis` (`id`, `disease`, `medicine`, `created_on`, `doctor_id`, `patient_id`, `num_symptoms`) VALUES
(9, 'Alcoholic Hepatitis', 'Paracetamol Tablet 500mg', '2024-03-25 16:52:13.017255', NULL, 27, 9),
(10, 'Alcoholic Hepatitis', 'Calamine ', '2024-03-25 16:53:28.997823', NULL, 27, 8),
(11, 'Bronchial Asthma', 'Paracetamol Tablet 500mg', '2024-03-26 00:03:56.821285', NULL, 30, 5),
(12, 'Paralysis (brain hemorrhage)', 'Calamine Lotion', '2024-03-31 00:13:34.547033', NULL, 30, 2),
(13, 'Osteoarthritis', '', '2024-04-04 22:50:53.433060', NULL, 30, 5),
(15, 'skin infection', 'Canvaz Gel(Topical) 15gm', '2024-04-04 23:41:55.305907', NULL, 30, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_appointments_doctor_id` (`doctor_id`),
  ADD KEY `fk_appointments_medical_id` (`medical_id`),
  ADD KEY `fk_appointments_patient_id` (`patient_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `core_profile`
--
ALTER TABLE `core_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `core_user`
--
ALTER TABLE `core_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `core_user_groups`
--
ALTER TABLE `core_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  ADD KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `core_user_user_permissions`
--
ALTER TABLE `core_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  ADD KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `diagnosis_symptoms`
--
ALTER TABLE `diagnosis_symptoms`
  ADD UNIQUE KEY `unique_patient_diagnosis_symptom` (`patient_diagnosis_id`,`symptom`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_core_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `patient_diagnosis`
--
ALTER TABLE `patient_diagnosis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient_diagnosis_doctor_id` (`doctor_id`),
  ADD KEY `fk_patient_diagnosis_patient_id` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `core_profile`
--
ALTER TABLE `core_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `core_user`
--
ALTER TABLE `core_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `core_user_groups`
--
ALTER TABLE `core_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_user_user_permissions`
--
ALTER TABLE `core_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `patient_diagnosis`
--
ALTER TABLE `patient_diagnosis`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointments_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `core_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_appointments_medical_id` FOREIGN KEY (`medical_id`) REFERENCES `patient_diagnosis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_appointments_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `core_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `core_profile`
--
ALTER TABLE `core_profile`
  ADD CONSTRAINT `core_profile_user_id_bf8ada58_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`);

--
-- Constraints for table `core_user_groups`
--
ALTER TABLE `core_user_groups`
  ADD CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`);

--
-- Constraints for table `core_user_user_permissions`
--
ALTER TABLE `core_user_user_permissions`
  ADD CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`);

--
-- Constraints for table `diagnosis_symptoms`
--
ALTER TABLE `diagnosis_symptoms`
  ADD CONSTRAINT `fk_diagnosis_symptoms_patient_diagnosis_id` FOREIGN KEY (`patient_diagnosis_id`) REFERENCES `patient_diagnosis` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`);

--
-- Constraints for table `patient_diagnosis`
--
ALTER TABLE `patient_diagnosis`
  ADD CONSTRAINT `fk_patient_diagnosis_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `core_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_patient_diagnosis_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `core_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
