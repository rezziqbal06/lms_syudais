<style>
    .card-header {
        background-image: url('<?= base_url('media/bg-card.png') ?>');
        background-repeat: no-repeat;
        background-position: top;
        padding: 1rem !important;
    }
</style>
<section>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="border rounded-2 row p-2 mb-3">
                        <div class="col-4 col-md-2">
                            <img src="<?= base_url("media/world-connection-two-color.png") ?>" class="img-fluid" alt="">
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center ">
                            <p class="m-0"><b>Ahlan wa sahlan <br class="d-block d-md-none"><?= $sess->user->fnama ?></b><br>di Sistem Akademik Syudais (Syubbaanul 'Uluum Dakwah Islam) <br> Membantu antum menjadi manusia yang bermanfaat.</p>
                        </div>
                    </div>
                    <div class="row">
                        <?php if (isset($sess->user->program[0])) {
                            foreach ($sess->user->program as $k => $v) { ?>
                                <div class="col-6 col-md-3">
                                    <a href="<?= base_url('program/' . $v->slug) ?>">
                                        <div class="card mb-3">
                                            <div class="card-header" style="background-color: <?= $v->warna ?? '#dedede' ?>; border-radius: 12px;">
                                                <span class="text-white"><i class="<?= $v->icon ?? 'ni ni-app' ?> text-white text-lg opacity-10 me-3"></i> <br class="d-block d-md-none"><?= $v->nama ?? '' ?></span>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                        <?php }
                        } ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">

        </div>
    </div>

</section>
<section class="d-none">
    <div class="row">
        <div class="col-md-7 mb-4">
            <div class="card">
                <div class="card-header">
                    Omset Perbulan
                </div>
                <div class="card-body">
                    <canvas id="line-chart-gradient-omset" class="chart-canvas" height="300px"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-5 mb-4">
            <div class="card">
                <div class="card-header">
                    Jumlah Order Perbulan
                </div>
                <div class="card-body">
                    <canvas id="line-chart-gradient-jumlah" class="chart-canvas" height="300px"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-4">

            <div class="card">
                <div class="card-header">
                    Order Bulan Ini
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <tr>
                            <th>Kode</th>
                            <th>Produk</th>
                            <th>Pembeli</th>
                            <th>Tanggal Pesan</th>
                            <th>Status</th>
                        </tr>
                        <?php if (isset($orders[0])) : ?>
                            <?php foreach ($orders as $o) : ?>
                                <tr>
                                    <td><?= $o->kode ?></td>
                                    <td><?= $o->produk ?></td>
                                    <td><?= $o->pembeli ?></td>
                                    <td><?= $o->tgl_pesan ?></td>
                                    <td><?= $o->status_badge ?></td>
                                </tr>
                            <?php endforeach ?>
                        <?php endif ?>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>