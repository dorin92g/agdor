<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $salt
 * @property string $email
 * @property string $firstname
 * @property string $lastname
 * @property string $phone
 * @property string $mobile
 * @property string $company_name
 * @property string $career
 * @property string $profile
 * @property string $user_title
 * @property string $form_of_address
 * @property string $age_range
 * @property string $gender
 * @property string $country_cc
 * @property string $city_id
 * @property string $user_image
 * @property string $user_image_thumb
 * @property string $lastlogin
 * @property integer $enabled
 * @property integer $newsletter
 * @property integer $deleted
 * @property string $added
 * @property string $updated
 * @property integer $added_by
 * @property integer $updated_by
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * @return \yii\db\Connection the database connection used by this AR class.
     */
    public static function getDb()
    {
        return Yii::$app->get('dbUser');
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['password', 'salt', 'email'], 'required'],
            [['profile'], 'string'],
            [['city_id', 'enabled', 'newsletter', 'deleted', 'added_by', 'updated_by'], 'integer'],
            [['lastlogin', 'added', 'updated'], 'safe'],
            [['username', 'password', 'salt', 'email', 'firstname', 'lastname', 'phone', 'mobile', 'company_name', 'career', 'user_title', 'form_of_address', 'age_range', 'gender'], 'string', 'max' => 255],
            [['country_cc'], 'string', 'max' => 6],
            [['user_image', 'user_image_thumb'], 'string', 'max' => 1024],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'password' => 'Password',
            'salt' => 'Salt',
            'email' => 'Email',
            'firstname' => 'Firstname',
            'lastname' => 'Lastname',
            'phone' => 'Phone',
            'mobile' => 'Mobile',
            'company_name' => 'Company Name',
            'career' => 'Career',
            'profile' => 'Profile',
            'user_title' => 'User Title',
            'form_of_address' => 'Form Of Address',
            'age_range' => 'Age Range',
            'gender' => 'Gender',
            'country_cc' => 'Country Cc',
            'city_id' => 'City ID',
            'user_image' => 'User Image',
            'user_image_thumb' => 'User Image Thumb',
            'lastlogin' => 'Lastlogin',
            'enabled' => 'Enabled',
            'newsletter' => 'Newsletter',
            'deleted' => 'Deleted',
            'added' => 'Added',
            'updated' => 'Updated',
            'added_by' => 'Added By',
            'updated_by' => 'Updated By',
        ];
    }
}
