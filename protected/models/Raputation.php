<?php

/**
 * This is the model class for table "raputation".
 *
 * The followings are the available columns in table 'raputation':
 * @property integer $id
 * @property string $tanggal
 * @property integer $jenis
 * @property integer $pemberi_id
 * @property integer $penerima_id
 *
 * The followings are the available model relations:
 * @property User $penerima
 * @property User $pemberi
 */
class Raputation extends CActiveRecord
{
	public $nilai;
	/**
	 * Returns the static model of the specified AR class.
	 * @return Raputation the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'raputation';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('tanggal, jenis, pemberi_id, penerima_id', 'required'),
			array('jenis, pemberi_id, penerima_id', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, tanggal, jenis, pemberi_id, penerima_id', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'penerima' => array(self::BELONGS_TO, 'User', 'penerima_id'),
			'pemberi' => array(self::BELONGS_TO, 'User', 'pemberi_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'tanggal' => 'Tanggal',
			'jenis' => 'Jenis',
			'pemberi_id' => 'Pemberi',
			'penerima_id' => 'Penerima',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('tanggal',$this->tanggal,true);
		$criteria->compare('jenis',$this->jenis);
		$criteria->compare('pemberi_id',$this->pemberi_id);
		$criteria->compare('penerima_id',$this->penerima_id);

		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,
		));
	}
	
	public function reput($id)
	{
		$hasil = $this->findBySql('select sum(jenis) as nilai from raputation
        		where penerima_id="'.$id.'"', array());
		if($hasil->nilai==NULL)
			$hasil->nilai=0;
		return $hasil->nilai;
	}
}