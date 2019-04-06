<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "config".
 *
 * @property integer $id
 * @property string $name
 * @property string $value
 * @property string $description
 * @property string $added
 * @property integer $added_by
 * @property string $updated
 * @property integer $updated_by
 */
class Config extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'config';
    }

    /**
     * @return \yii\db\Connection the database connection used by this AR class.
     */
    public static function getDb()
    {
        return Yii::$app->get('dbSettings');
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'value', 'added_by'], 'required'],
            [['added', 'updated'], 'safe'],
            [['added_by', 'updated_by'], 'integer'],
            [['name', 'value'], 'string', 'max' => 255],
            [['description'], 'string', 'max' => 1024],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'value' => 'Value',
            'description' => 'Description',
            'added' => 'Added',
            'added_by' => 'Added By',
            'updated' => 'Updated',
            'updated_by' => 'Updated By',
        ];
    }
}
