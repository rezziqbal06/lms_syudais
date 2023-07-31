<?php

namespace Model;

register_namespace(__NAMESPACE__);
/**
 * Define all general method(s) and constant(s) for b_jadwal_kegiatan table,
 *   can be inherited a Concern class also can be reffered as class constants
 *
 * @version 1.0.0
 *
 * @package Model\B_User
 * @since 1.0.0
 */
class B_Jadwal_Kegiatan_Concern extends \JI_Model
{
    public $tbl = 'b_jadwal_kegiatan';
    public $tbl_as = 'bjk';
    // public $tbl2 = 'b_user_alamat';
    // public $tbl2_as = 'bua';
    // public $tbl3 = 'a_company';
    // public $tbl3_as = 'ac';

    const COLUMNS = [
        'a_program_id',
        'a_pengguna_id',
        'b_user_id',
        'b_user_id_narasumber',
        'a_jabatan_id_sasaran',
        'nama',
        'slug',
        'tempat',
        'cdate',
        'sdate',
        'edate',
        'stime',
        'etime',
        'sasaran',
        'narasumber',
        'gmaps_link',
        'gmaps_lat',
        'gmaps_long',
        'negara',
        'provinsi',
        'kabkota',
        'kecamatan',
        'kelurahan',
        'alamat',
        'kodepos',
        'telp',
        'deskripsi',
        'featured_image',
        'hari',
        'is_rutin',
        'is_deleted',
        'is_active',
    ];
    const DEFAULTS = [
        null,
        null,
        null,
        null,
        null,
        '',
        '',
        '',
        null,
        null,
        null,
        null,
        null,
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        null,
        '',
        '',
        '',
        0,
        0,
        1
    ];
    const REQUIREDS = [
        'nama',
        'sdate',

    ];
    const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    /**
     * Install HTML bootstrap label into certain columns
     *
     * @return object this current object
     */
    private function install_labels()
    {
        $this->labels['is_active'] = new \Seme_Flaglabel();
        $this->labels['is_active']->init_is_active();

        $this->labels['is_deleted'] = new \Seme_Flaglabel();
        $this->labels['is_deleted']->init_is_deleted();

        return $this;
    }

    public function __construct()
    {
        parent::__construct();
        $this->install_labels()->db->from($this->tbl, $this->tbl_as);

        /** dont forget to define point_of_view property on your class model */
        $this->define_columns(self::COLUMNS, self::REQUIREDS, self::DEFAULTS);

        $this->datatables['admin'] = new \Seme_Datatable([
            ["$this->tbl_as.id", 'id', 'ID'],
            ["$this->tbl_as.nama", 'nama', 'Nama Unit'],
            ["$this->tbl_as.deskripsi", 'deskripsi', 'Deskripsi'],
            ["$this->tbl_as.is_active", 'is_active', 'Status']
        ]);

        $this->datatables['front'] = new \Seme_Datatable([
            ["$this->tbl_as.id", 'id', 'ID'],
            ["$this->tbl_as.nama", 'nama', 'Nama Unit'],
            ["$this->tbl_as.deskripsi", 'deskripsi', 'Deskripsi'],
            ["$this->tbl_as.is_active", 'is_active', 'Status']
        ]);

        // $this->datatables['front'] = new \Seme_Datatable([
        //     ["$this->tbl_as.id", 'id', 'ID'],
        //     ["$this->tbl_as.fnama", 'fnama', 'Nama'],
        //     ["$this->tbl_as.telp", 'telp', 'Telp'],
        //     ["$this->tbl_as.email", 'email', 'Email'],
        //     ["$this->tbl_as.utype", 'utype', 'Utype'],
        //     ["$this->tbl_as.is_active", 'is_active', 'Status']
        // ]);

        // $this->datatables['download'] = new \Seme_Datatable([
        //     ["$this->tbl_as.fnama", 'fnama', 'Nama'],
        //     ["$this->tbl_as.telp", 'telp', 'Telp'],
        //     ["$this->tbl_as.email", 'email', 'Email'],
        //     ["$this->tbl_as.utype", 'utype', 'Utype'],
        //     ["$this->tbl2_as.provinsi", 'provinsi', 'Provinsi'],
        //     ["$this->tbl2_as.kabkota", 'kabkota', 'Kota'],
        //     ["$this->tbl2_as.kecamatan", 'kecamatan', 'Kecamatan'],
        //     ["$this->tbl2_as.alamat", 'alamat', 'Alamat'],
        //     ["$this->tbl2_as.alamat2", 'alamat2', 'Alamat 2'],
        //     ["$this->tbl2_as.kodepos", 'kodepos', 'Kodepos'],
        //     ["$this->tbl_as.is_active", 'is_active', 'Status']
        // ]);
    }

    public function email($email)
    {
        $this->db->where('email', $email);
        return $this->db->get_first();
    }

    public function setToken($id, $token, $kind = "api_web")
    {
        $this->db->where('id', $id);
        return $this->db->update($this->tbl, array(
            $kind . '_token' => $token
        ));
    }

    public function generator_prefix()
    {
        $alphabets = str_split(self::ALPHABET);

        $tgl = (int) date('j');
        $bln = (int) date('n');
        $thn = (int) date('y');

        return $alphabets[$tgl - 1] . $alphabets[$bln - 1] . $thn;
    }

    public function generator_kode()
    {
        $prefix = $this->generator_prefix();

        return $prefix . str_pad($this->last_kode($prefix), 6, '0', \STR_PAD_LEFT);
    }

    public function last_kode($prefix = '')
    {
        $this->db->flushQuery();
        $this->db->select_as('CAST(SUBSTRING(kode, 7) AS UNSIGNED)+1', 'urutan');
        $this->db->from($this->tbl, $this->tbl_as);
        $this->db->order_by('CAST(SUBSTRING(kode, 7) AS UNSIGNED)', 'desc');
        $this->db->where('kode', $prefix, 'AND', 'like%');
        $d = $this->db->get_first('object', 0);
        if (isset($d->urutan)) {
            return (int) $d->urutan;
        }
        return 0;
    }
}
